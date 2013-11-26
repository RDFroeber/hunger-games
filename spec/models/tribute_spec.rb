require 'spec_helper'

describe Tribute do
  let(:d) {District.all.sample}
  let(:girl) {Citizen.new(district: d, name: "LISA HORNER", gender: "F", age: 17, type: "Tribute")}

 
end