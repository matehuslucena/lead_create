class LeadCreate
  def self.create(contato)
    connect
    load_new_lead(contato)
    if(@lead.all.select { |lead| lead.FirstName == @new_lead.FirstName }.empty?)
      if @new_lead.save
        contato.name + ' successfully added'
      end
    else
      'This contact has already been added'
    end
  end

  def self.list_leads
    connect
    lead = take_lead
    lead.all
  end

  private
  def self.connect
    unless File.exist?('config/databasedotcom.yml')
      raise 'Please create file \'/config/databasedotcom.yml\''
    end
    @client = Databasedotcom::Client.new('config/databasedotcom.yml')
    file = YAML.load_file('config/databasedotcom.yml')
    @client.authenticate :username => file['username'], :password => file['password']
  end

  def self.take_lead
    @client.materialize('Lead')
  end

  def self.load_new_lead(contato)
    @lead = @client.materialize('Lead')
    @new_lead = @lead.new
    user = @client.materialize('User')
    @new_lead.OwnerId = user.first.Id
    @new_lead.FirstName = contato.name
    @new_lead.LastName = contato.last_name
    @new_lead.Email = contato.email
    @new_lead.Company = contato.company
    @new_lead.Title = contato.job_title
    @new_lead.Phone = contato.phone
    @new_lead.Website = contato.website
    @new_lead.IsConverted = false
    @new_lead.IsUnreadByOwner = true
  end
end