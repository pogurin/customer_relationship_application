class Rolodex
  attr_reader :contacts  # We have to put ttr_reader :contacts in order to read information from contact.

  @@index = 1000 # class variable.

  def initialize # 引数がない場合、()はいらない。
    @contacts = [] #When we put @contact, it brings []. 
    #initializeしたのは、[]に値を入れるため。

  # a = 3 
  # puts a 
  # => 3 

# [] = (first_name, .....)

  # How does this array store contacts ?? 
  end

  def add_contact(contact)
    contact.id = @@index  #contact.idに@@indexを代入。
    # この時点で、@@indexは、contactの一部になっている。
    # def "id=" (id) #ここのパラメーターに値がはいるらしい。  
    #   @id = id
    # end
    
    # This is instance of class Contact. 

                          #次の行で、コンタクトが追加される毎に、@@indexに
                          #数字が足されて行く。
    @@index += 1

    @contacts << contact  
    # この時点で、
    # @contact にcontactを入れる。
    # @contactにcontactの内容が入る。
    # やはりここで情報がarrayに入っている様子。
    # contact はlocal variavleだが、 attr_reader :contacts
    # によって、参照可能。

  end 

  def update_contact(contact_id, first) # contact_id
    @contacts.each do |contact|
      # @contactsは[]から来ているのか。
      # もしも、そうならアレイの中身を全て閲覧。


      #ここの、@contactsはアレイを示している。
      if contact.id == contact_id 
        #crm.rbファイルで、定義された(id_to_change,new_name)が
        #(contact_id, first)に代入される。
        contact.first_name = first
        # イコールを含めると。ライター。
        # contact.first_name にfirstが代入される。
        # contact 
        puts "setting contact name to #{first}"
        # ここで、firstの内容をcontact.first_nameに代入している。
        # firstはcontact.rbファイルにアトラーがあるので、中身がやってくる。
        # contactファイルの、variableであるfirst_nameがfirstに書き変わる。
      end    
    end 
  end

  def update_contact_last(contact_id, last)
    @contacts.each do |contact|
      # contacts つまり[]arrayの中身をサーチ。

      if contact.id == contact_id
        puts "setting contact name to #{last}"
        contact.last_name = last 
      end
    end
  end

  def update_contact_email(contact_id, email)
    @contacts.each do |contact|
      if contact.id == contact_id
        puts "setting contact email to #{email}"
        contact.email = email 
      end
    end
  end

  def update_contact_note(contact_id, note)
    @contacts.each do |contact|
      if contact.id == contact_id
        puts "setting contact note to #{note}"
        contact.note = note 
      end
    end
  end


  def display_contact(id_to_display)
    @contacts.each do |contact|
      if contact.id == id_to_display
       puts "This is your contact: {#{contact.first_name} #{contact.last_name} <#{contact.email}>,#{contact.note}!"

     end
   end
 end

  def delete_contact(contact_id)
    @contacts.each do |contact|
      if contact.id == contact_id
        puts "Your contents has been deleted." 
        contacts.delete(contact) #これがキーだった。contactsという配列から、contactが消える。

      end 
    end
  end

  def self.fabio
    puts 'blah'
  end

end