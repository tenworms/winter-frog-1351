require 'rails_helper'

RSpec.describe 'Plot Index Page' do
  it 'shows list of all plot numbers and plants' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

    plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    plot2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    plot3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
    plot4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

    rose = Plant.create!(name: "Rose", description: "prickly", days_to_harvert: 12)
    daisy = Plant.create!(name: "Daisy", description: "pretty", days_to_harvert: 45)
    tulip = Plant.create!(name: "Tulip", description: "reddish", days_to_harvert: 2)
    orchid = Plant.create!(name: "Orchid", description: "who knows", days_to_harvert: 4)

    PlantPots.create!(plant_id: rose.id, plot_id: plot1.id)
    PlantPots.create!(plant_id: daisy.id, plot_id: plot1.id)
    PlantPots.create!(plant_id: tulip.id, plot_id: plot2.id)
    PlantPots.create!(plant_id: orchid.id, plot_id: plot3.id)



    visit "/plots"

    #within "#plot-#{plot1.id}" do

    expect(page).to have_content("#{plot1.size}")
    expect(page).to have_content("#{plot1.direction}")
    expect(page).to have_content("#{rose.name}")
    expect(page).to have_content("#{daisy.name}")
    expect(page).to_not have_content("#{tulip.name}")
    #end
  end
end
