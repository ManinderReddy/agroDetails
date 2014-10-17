class ReportMailer < ActionMailer::Base
  default from: "evurimanikanta@gmail.com"

  def send_report(user,report_type,path)
    @user = user
    attachments["#{report_type}_report.csv"] = File.read(path) if File.exist?(path)
    mail(:to => "#{user.first_name} #{user.last_name} <#{user.email}>", :subject => "#{report_type} Report")
  end

end
