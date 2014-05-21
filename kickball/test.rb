require 'csv'



def load_contacts(file_name)
  contacts = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |contact|
    contacts << contact.to_hash
  end
  contacts
end
array = load_contacts('lackp_starting_rosters.csv')
#puts array

def team_simpson_slammers(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Simpson Slammers"
      final_array << nested_hash
    end
  end
  final_array
end
simpson_slammers = team_simpson_slammers(array)
#puts simpson_slammers

def team_jetson_jets(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Jetson Jets"
      final_array << nested_hash
    end
  end
  final_array
end
jetson_jets = team_jetson_jets(array)
#puts jetson_jets


def team_griffin_goats(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Griffin Goats"
      final_array << nested_hash
    end
  end
  final_array
end
griffin_goats = team_griffin_goats(array)
#puts griffin_goats


def team_flineston_fire(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Flinestone Fire"
      final_array << nested_hash
    end
  end
  final_array
end
flineston_fire = team_flineston_fire(array)
puts flineston_fire
