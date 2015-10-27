require_relative "entry.rb"
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  # add an entry with name, phone number and email
  def add_entry(name, phone, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone, email))
  end

  # remove entry by name/ phone number/ email
  def remove_entry(name, phone, email)
    @entries.each do |entry|
      unless email.nil? or entry.email == email
        @entries.delete(entry)
        break
      end
      unless name.nil? or entry.name == name
        @entries.delete(entry)
        break
      end
      unless phone.nil? or entry.phone_number == phone
        @entries.delete(entry)
        break
      end
    end
  end

  # import data from a CSV file
  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash['name'], row_hash['phone_number'], row_hash['email'])
    end
  end

  # Search for specific entry - binary search method
  def binary_search(name)
    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end
    return nil
  end

  # Search for specific entry - iterative search method
  def iterative_search(name)
    entries.each do |entry|
      if entry.name == name
        return entry
      end
    end
    return nil
  end

end