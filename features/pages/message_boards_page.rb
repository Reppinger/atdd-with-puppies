class MessageBoardsPage
  def initialize(browser)
    @browser = browser
  end

  def post(nickname, body)
    @browser.link(text: 'Post a Message').click
    @browser.text_field(id: 'discussion_post_nickname').wait_until_present.set(nickname)
    @browser.textarea(id: 'discussion_post_body').set(body)
  end

  def post_found?(expected_body)
    posts.any? { |post| post.include?(expected_body)}
  end

  private
  def posts
    @browser.div(class: 'card').wait_until_present
    @browser.divs(class: 'message-content').map do |message|
      message.text
    end
  end

end