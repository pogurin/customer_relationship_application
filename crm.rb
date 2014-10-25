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
    when 4 then display_contact #Idからどのコンタクトを表示させたいのか選ぶ？　does it mean choosing contact from ID ?
    when 5 then display_attribute # Does it mean just desplaying all last name or all first name or....
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

  def display_all_contacts 
    @rolodex.contacts.each do |contact| #Dispray all information of content.
      puts "#{contact.id} #{contact.first_name} #{contact.last_name} <#{contact.email}>"
    end 
  end

  def modify_contact
    display_all_contacts #これで、上のメソッドを使用可能。

    puts "please choose information which you want to change."
    id_to_change = gets.chomp.to_i 

    puts "Please choose which attribute you want to change."
    puts "1 First Name, 2 Last name, 3 Email , 4 Note."
    option = gets.chomp.to_i #convert string input to number.
    

    case option             
    when 1 then
      puts "Enter the new name."
      new_name = gets.chomp
      @rolodex.update_contact(id_to_change,new_name)

    when 2 then 
      puts "Enter the new last name."
      new_last_name = gets.chomp
      @rolodex.update_contact_last(id_to_change,new_last_name) #id_to_change coeresponds to contact_id.
      
    when 3 then 
      puts "Enter the new email."
      new_email = gets.chomp
      @rolodex.update_contact_email(id_to_change,new_email)

    when 4 then 
      puts "Enter the new note."
      new_note = gets.chomp
      @rolodex.update_contact_note(id_to_change,new_note)
    end
  end

  def display_contact 
    puts "please type your ID."
    id_to_display = gets.chomp.to_i
    @rolodex.display_contact(id_to_display)
  end


  def display_attribute

    puts "Please choose which attribute you want to display."
    puts "1 First Name, 2 Last name, 3 Email , 4 Note."
    option_attribute = gets.chomp.to_i

    case option_attribute 

    when 1
      @rolodex.contacts.each do |contact|
        puts "#{contact.first_name}"
      end
    when 2
      @rolodex.contacts.each do |contact|
        puts "#{contact.last_name}"
      end
    when 3
      @rolodex.contacts.each do |contact|
        puts "#{contact.email}"
      end
    when 4
      @rolodex.contacts.each do |contact|
        puts "#{contact.note}"
      end
    when 5
      @rolodex.contacts.each do |contact|
        puts "#{contact.id}"
      end
    end
  end

  def delete_contact
    print "Enter the ID you wish to delete: "
    id_delete = gets.chomp.to_i
    @rolodex.delete_contact(id_delete)

  end
end



crm = CRM.new("Bitmaker Labs CRM") # It will execute all processes.
crm.main_menu

