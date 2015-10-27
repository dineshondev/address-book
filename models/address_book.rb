require_relative "entry.rb"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

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

end