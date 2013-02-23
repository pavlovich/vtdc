class MemberMailer < ActionMailer::Base
  default :from => "no-reply@#{host}"

  def forgot_password(member, key)
    @member, @key = member, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => member.email_address )
  end

  def invite(member, key)
    @member, @key = member, key
    mail( :subject => "Invitation to #{app_name}",
          :to      => member.email_address )
  end

end
