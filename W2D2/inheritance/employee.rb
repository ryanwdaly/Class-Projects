class Employee
  attr_reader :name, :last, :salary
  attr_accessor :boss

  def initialize(name, last, salary, boss = nil)
    @name = name
    @last = last
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
    @bonus
  end

  def show_boss
    return @boss unless boss.nil?
    nil
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, last, salary, boss = nil)
    @employees = []
    super
  end

  def bonus(multiplier)
    self.total_salary * multiplier
  end

  def total_salary
    total = 0
    @employees.each do |employee|
      if employee.class == Manager
        total += employee.total_salary
      else
        total += employee.salary
      end
    end
    total + self.salary
  end

  def add_employee(employee)
    @employees.push(employee)
    employee.boss = self
  end

  def show_employees
    @employees
  end

end


class Chart
  attr_accessor :grid

  def initialize(grid = Array.new(10){Array.new(4)})
    @grid = grid
  end

  def populate(staff)
    @grid.each do |em|
      em.each_with_index do |val, idx|
        if idx == 0
        val = staff.name
      elsif idx == 1
        val = staff.last
      elsif idx == 2
        val = staff.salary
      elsif idx == 3
        val = staff.boss
      end
    end
  end
end

  def render
    @grid.each do |x|
      print "*#{x}*"
      x.each do |y|
          print "#{y}"
      end
      puts
    end
  end
end
if __FILE__ == $PROGRAM_NAME
  em1 = Employee.new("a", "a", 5000)
  em2 = Employee.new("b", "b", 5000)
  em3 = Employee.new("c", "c", 5000)
  man1 = Manager.new("d", "d", 10000)
  man2 = Manager.new("e", "f", 10000)
  boss = Manager.new("g", "g", 50000)

  # p em1
  # p em2
  # p em3
  #
  # p man1
  # p man2
  #
  # p boss

   man1.add_employee(em1)
   man1.add_employee(em2)

   man2.add_employee(em3)

  boss.add_employee(man1)
   boss.add_employee(man2)

  # p em1.bonus(10)
  # p em2.bonus(10)
  # p em3.bonus(10)

 man1.total_salary
  man2.total_salary

 boss.total_salary




end
