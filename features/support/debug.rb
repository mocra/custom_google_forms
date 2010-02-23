After do |scenario|
  $opened_page_count ||= 0
  if scenario.status == :failed && ($opened_page_count < 5)
    save_and_open_page
    $opened_page_count += 1
    if ENV['PAUSE']
      puts "Press any key to continue."
      STDIN.getc
    end
  end
end