class ThingDecorator < Draper::Decorator
  delegate_all

  def member_name
      return object.member.name
  end

end
