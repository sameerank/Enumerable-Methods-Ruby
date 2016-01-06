class MovieGoer
  def initialize(person_in_front = nil)
    @person_in_front = person_in_front
  end

  def row_num
    if @person_in_front.nil?
      1
    else
      @person_in_front.row_num + 1
    end
  end
end
