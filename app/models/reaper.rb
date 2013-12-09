class Reaper
  def initialize(game_id)
    @game_id = game_id
    cap_id = District.find_by(name: "The Capitol").id
    @capitolites = Citizen.where(district_id: cap_id, age: 25..50)
    # Find all eligible Citizens for the Reaping (Districts 1-12 & Age 12-18)
    @eligible_citizens = Citizen.where.not(district_id: cap_id).where(age: 12..18, type: nil)
    @tributes = []
    @escorts = []
  end

  attr_accessor :game_id, :tributes, :capitolites, :escorts, :eligible_citizens

  def multiply_tesserae
    multiplied_reapees = []

    # Multiply each by number of tesserae
    eligible_citizens.each do |r|
      r.tesserae.times { multiplied_reapees << r }
    end

    multiplied_reapees
  end

  def select_tributes
    reap = {d1: [],d2: [],d3: [],d4: [],d5: [],d6: [],d7: [],d8: [],d9: [],d10: [],d11: [],d12: []}

    # Split eligible citizens by district
    multiply_tesserae.each do |r|
      case r.district.name 
      when "District 1"
        reap[:d1] << r
      when "District 2"
        reap[:d2] << r
      when "District 3"
        reap[:d3] << r
      when "District 4"
        reap[:d4] << r
      when "District 5"
        reap[:d5] << r
      when "District 6"
        reap[:d6] << r
      when "District 7"
        reap[:d7] << r
      when "District 8"
        reap[:d8] << r
      when "District 9"
        reap[:d9] << r
      when "District 10"
        reap[:d10] << r
      when "District 11"
        reap[:d11] << r
      when "District 12"
        reap[:d12] << r
      end
    end

    # Select 1 Male and 1 Female from each District

    reap.each do |d, a|
      chosen1 = a.sample
      if chosen1.gender == "F"
        # tribute << {d => {f: chosen1}}
        chosen2 = a.sample
        until chosen2.gender == "M"
          chosen2 = a.sample
        end
        tributes << chosen2 && tributes << chosen1

      else
        # tribute << {d => {m: chosen1}}
        chosen2 = a.sample
        until chosen2.gender == "F"
          chosen2 = a.sample
        end
        tributes << chosen1 && tributes << chosen2
      end
    end

    designate_tributes
    select_escorts
    assign_escorts
  end

  def designate_tributes
    tributes.map! do |tribute|
      tribute.type = "Tribute"
      tribute.game_id = game_id
      tribute.tesserae = nil
      tribute.save
      Citizen.find(tribute.id)
    end
  end

  def select_escorts
    12.times do
      escorts << capitolites.sample
    end

    escorts.map! do |escort|
      escort.type = "Escort"
      escort.game_id = game_id
      escort.save
      Citizen.find(escort.id)
    end
  end

  def assign_escorts
    tributes.each do |tribute|
      escorts.each do |escort|
        d = tribute.district.name.match(/District\s(\d+)/)[1]
        tribute.escort = escorts[d.to_i - 1] 
      end
    end
    # binding.pry
  end

  def increase_tesserae
    eligible_citizens.each do |citizen|
      citizen.tesserae = (citizen.tesserae.to_i + 1).to_s
    end
  end
end