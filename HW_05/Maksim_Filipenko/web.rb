require 'json'
require 'net/http'

# Module web with methods for web work
module Web
  def do_request(homework, student, pr_title)
    uri = URI('http://www.example.com')
    res = Net::HTTP.post_form(uri, 'Content-Type' => 'application/json')
    res.body = body_json(homework, student, pr_title)
    puts res
  end

  def notifications(student)
    notification = {
      status: 'unread',
      body: "#{student.fullname} has sent homework #{student.submited.last}"
    }
    notification
  end

  private

  def body_json(homework, student, pr_title)
    body = {
      homework: homework,
      student: student,
      pr_title: pr_title
    }
    body.to_json
  end
end
