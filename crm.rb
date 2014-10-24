require_relative './contact.rb' # ここでコネクトさせる。
require_relative './rolodex.rb'

class CRM
  attr_reader :name 

  def initialize(name)
    @name = name 
    @rolodex = Rolodex.new # @rolodex calls information of Rolodex.new. The information is Rolodex class.
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Enter a number:" # It is able to be displayed because of "put".
  end

  def main_menu
    puts "Welcome to #{@name}" # It comes from below crm.main_menu.

    while true #repeat because of While
      print_main_menu
      input = gets.chomp.to_i
      return if input == 7 #Repeat until we can see 7,input==7 calls retuen, it can make this process stop. 
      choose_option(input) #The number which was ritten at input will be stored at (input) parameter.
    end
  end

  def choose_option(option) #Above choose_option(input) bring values to (option).
    case option             #Inside of parameter (input),(option) already has a number, so the name of parameter is not matter. 
    when 1 then add_contact
    when 2 then modify_contact # => to method modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_attribute
    when 6 then delete_contact
    else
      puts "Invalid option. Try again!"
      return
    end
  end

  def add_contact # Because of calling 1 
    print "First Name: " 
    first_name = gets.chomp # To write a name.
    print "Last Name: "
    last_name = gets.chomp
    print "Email: "
    email = gets.chomp
    print "Note: "
    note = gets.chomp

    contact = Contact.new(first_name, last_name, email, note) #initialize by using variable contact.
    #Class Contact was made.
    @rolodex.add_contact(contact) # is it coresponding with above contact variable ??  
  end

  def display_all_contacts # もしも、Id が正しければ。
    @rolodex.contacts.each do |contact| #Dispray all information of content.
      puts "#{contact.first_name} #{contact.last_name} <#{contact.email}>"
    end 
    puts
  end

crm = CRM.new("Bitmaker Labs CRM") # It will execute all processes.
crm.main_menu


end