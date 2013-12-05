class Reaper
  def initialize
    cap_id = District.find_by(name: 'The Capitol')
    # Find all eligible Citizens for the Reaping (Districts 1-12 & Age 12-18)
    @reapees = Citizen.where.not(district_id: cap_id).where(age: 12..18)
    @tributes = []
  end

  def eligible_citizens
    @reapees
  end

  def tributes
    @tributes
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
      case r.district_id 
      when 2
        reap[:d1] << r
      when 3
        reap[:d2] << r
      when 4
        reap[:d3] << r
      when 5
        reap[:d4] << r
      when 6
        reap[:d5] << r
      when 7
        reap[:d6] << r
      when 8
        reap[:d7] << r
      when 9
        reap[:d8] << r
      when 10
        reap[:d9] << r
      when 11
        reap[:d10] << r
      when 12
        reap[:d11] << r
      when 13
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
    
    @tributes
  end

  def designate_tributes
    @tributes.each do |tribute|
      tribute.type = "Tribute"
    end
  end

end