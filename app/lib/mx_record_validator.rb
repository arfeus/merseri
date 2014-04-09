require 'resolv'

class MxRecordValidator < ActiveModel::EachValidator 
  def validate_each(record, attribute, value) 
    mail_servers = Resolv::DNS.open.getresources(value.split('@')[1], Resolv::DNS::Resource::IN::MX) 
    if mail_servers.empty?
      record.errors[attribute] << "not valid" 
    end 
  end 
end