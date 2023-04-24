class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true, default: 1

    Comment.all.each do |comment|
      user = User.find_by(email: comment.email)
      comment.update(user_id: user.id) if user.present?
    end
  end
end
