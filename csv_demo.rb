require "csv"

filepath = "data/beers.csv"

# PARSING
beers = []
CSV.foreach(filepath, headers: :first_row) do |row|
  # p row
  # row ~> ["Name", "Apearance", "Origin"]
  # row se comporte comme un array
  beer = {
    name: row["name"],
    apearance: row["apearance"],
    origin: row["origin"]
    # comment: row["comment"]
  }
  beers << beer
end

# Ajoutons une bière à ce tableau !

beers << { name: "Hoogarden",apearance: "White", origin: "Belgium" }

p beers

# STORING

CSV.open(filepath, "wb") do |csv|
  csv << ["name", "apearance", "origin"]
  beers.each do |beer|
    csv << [beer[:name], beer[:apearance], beer[:origin]]
  end
end
