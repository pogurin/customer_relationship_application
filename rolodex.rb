class Rolodex
  attr_reader :contacts  # We have to put ttr_reader :contacts in order to read information from contact.

  @@index = 1000 # class variable.

  def initialize 
    @contacts = [] #When we put @contact, it brings []. 
  end

  def add_contact(contact)
    contact.id = @@index  # You can read @@index because at above method uses @@index.
    @@index += 1 
    @contacts << contact # adding information to @contact 
  end 

  def update_contact(contact_id, first)
    @contacts.each do |contact|
      if contact.id == contact_id
        puts "setting contact name to #{first}"
        contact.first_name = first
      end    
    end 
  end

                     # @contacts brings [] 
end                      # << will add information into [].We can store information inside of [].