class Contact # Class is Blue print 
  attr_accessor :id, :first_name, :last_name, :email, :note #We have to use attr_accessor for bringing contact information to another class. especially Relodex class.
#この attr_accessor を置く事によって、他のクラスから
#first_nameなどを編集可能になる。
	@@biggestid = 1000
  def initialize(first_name, last_name, email, note) # cinitialized. The information from content become instance variable.
    @first_name = first_name                         # contact = Contact.new(first_name, last_name, email, note)
    @last_name = last_name
    @email = email
    @note = note 
    @id = @@biggestid 
    @@biggestid += 1 
  end

  # The accessors give us methods to read 
  
  #reader
  # def id
  # 	@id  
  # end

  # writer
  # def id=(id)
  # 	@id = id
  # end

  # accessor is reader AND writer

  # def first_name
  # 	@first_name
  # end

end


# ここのinitialize(first_name, last_name, email, note)の()の中の値は、
# crm.rbファイル57行目付近にあるContact.new
# からやってくる。そして、first_name は、@first_nameに代入される。これで、@first_name
# を呼べば、変数first_nameが呼ばれる。しかし、元ファイルでも変数なので、stringを
# 代入しないと行けない。

#contact = Contact.new(first_name, last_name, email, note)
