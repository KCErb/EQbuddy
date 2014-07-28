module EQbuddy
  def start
    @ments = Assignment.where(published: true)
    @ments.each do |ment|
      ment.teachers.each do |teacher|
        ment_box teacher.pref_name
      end
    end
  end
end
