class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.send_when_update.subject
  #
  def send_when_update(user)
    @user = user
    mail to:      user.email,
         subject: '参加予定のオフ会情報が更新されました。'
  end
end
