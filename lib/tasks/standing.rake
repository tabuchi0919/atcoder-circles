namespace :standing do
  task :create, [:id] => :environment do |_t, args|
    id = args[:id]
    contest = Contest.find(id)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options
    driver.navigate.to "https://atcoder.jp/contests/#{id}/standings"

    task_elements = driver.find_elements(:xpath, '//*[@id="main-container"]/div[1]/div[2]/div[3]/div[2]/table/thead/tr/th')
    task_elements[3..].each do |task_element|
      task = contest.tasks.build
      task.heading = task_element.text
      task.url = task_element.find_element(:xpath, 'a').attribute('href')
      task.save!
    end

    driver.find_elements(:class, 'standings-per-page').last.click

    page_count = driver.find_elements(:xpath, '//*[@id="main-container"]/div[1]/div[2]/div[2]/ul/li').count

    (1..page_count).each do |i|
      (1..1000).each do |j|
        standing = Standing.new(contest_id: id)
        elements = driver.find_elements(:xpath, "//*[@id=\"standings-tbody\"]/tr[#{j}]/td")
        break if elements.empty?

        standing.rank = elements[0].text
        standing.user_name = elements[1].text
        final_score_and_penalty, standing.final_time = elements[2].text.split("\n")
        standing.final_score, final_penalty = final_score_and_penalty.split(' ')
        standing.final_penalty = final_penalty[1..] if final_penalty
        standing.save!

        elements[3..].each do |element|
          submission = standing.submissions.build
          if element.text[0] == '('
            submission.penalty = element.text.to_i
          else
            score_and_penalty, submission.time = element.text.split("\n")
            submission.score, penalty = score_and_penalty.split(' ')
            submission.penalty = penalty[1..] if penalty
          end
          submission.save!
        end
      end
      break if i == page_count

      driver.find_element(:xpath, "//*[@id=\"main-container\"]/div[1]/div[2]/div[2]/ul/li[#{i + 1}]/a").click
    end
    driver.close
  end
end
