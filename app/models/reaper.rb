class Reaper
  def initialize
    cap_id = District.find_by(name: "The Capitol")
    @capitolites = Citizen.where(district_id: cap_id, age: 25..50)
    # Find all eligible Citizens for the Reaping (Districts 1-12 & Age 12-18)
    @reapees = Citizen.where.not(district_id: cap_id).where(age: 12..18, type: nil)
    @tributes = []
    @escorts = []
  end

  def eligible_citizens
    @reapees
  end

  def tributes
    @tributes
  end

  def escorts
    @escorts
  end

  def multiply_tesserae
    @multiplied_reapees = []

    # Multiply each by number of tesserae
    eligible_citizens.each do |r|
      r.tesserae.times { @multiplied_reapees << r }
    end

    @multiplied_reapees
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
        @tributes << chosen2 && @tributes << chosen1

      else
        # tribute << {d => {m: chosen1}}
        chosen2 = a.sample
        until chosen2.gender == "F"
          chosen2 = a.sample
        end
        @tributes << chosen1 && @tributes << chosen2
      end
    end

    designate_tributes
    select_escorts
    assign_escorts
  end

  def designate_tributes
    @tributes.each do |tribute|
      tribute.type = "Tribute"
      tribute.save
    end

    # @tributes.map! do |tribute|
    #   Tribute.new(tribute)
    # end
  end

  def select_escorts
    12.times do
      @escorts << @capitolites.sample
    end

    @escorts.each do |escort|
      escort.type = "Escort"
      escort.save
    end
  end

  def assign_escorts # TODO assign escorts to tributes
    @tributes.each do |tribute|
      tribute.escort = @escorts[tribute.district.name[-1].to_i - 1]
    end    
  end

end