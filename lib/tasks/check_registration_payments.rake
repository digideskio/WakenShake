namespace :check_registration_payments do
  desc "TODO"
  task check_and_send: :environment do
    if Date.today.in_time_zone('Eastern Time (US & Canada)').wday.odd?
      Dancer.all.each do |dancer|
        if dancer.charges.where(is_registration_fee: true).empty?
          RegistrationReminder.remind_dancer(dancer).deliver_later
          puts "Reminding #{dancer.first_name} to pay registration fee"
        end
      end
    end
  end

end
