# Ограниченное множество - линейный поиск
class BinSet
  DEF_SIZE = 7

  def initialize(size = DEF_SIZE)
    @array = Array.new(size)
    (0...DEF_SIZE).each do |i|
      @array[i]=0
    end
    empty
  end

  def empty; @size = 0 end

  def empty?; @size == 0 end

  def include?(val)
    !(binsearch(val).nil?) # Является ли элементом множества
  end

  def shift_forward(index) # Освобождаем позицию index для вставки
    (@size-1).downto(index) do |i|
      @array[i+1] = @array[i]
    end
  end

  def shift_backward(index)
    index.upto(@size-1) do |i|
      @array[i] = @array[i+1]
    end
  end

  def insert(val)
    raise 'BinSet is full' if @size >= @array.size # Если такого элемента не было, но и места тоже нет, то кидаем эксепшн
    if @size == 0
      @array[@size] = val; @size += 1
    elsif binsearch(val).nil?
          # Сначала найдем место, куда необходимо вставить новый элемен
          if val < @array[0] # Если первый
            shift_forward(0)
            @array[0] = val
            @size += 1
          else #  Иначе есть предыдущий
            previous = val - 1
            while (binsearch(previous).nil?)
              #puts "Size is #{@size}"
              #puts "Prev in cycle: #{previous} + binsearch: #{binsearch(previous)}"
              previous -= 1
            end
            #puts "Prev : #{previous} + binsearch: #{binsearch(previous)}"
            index = binsearch(previous) + 1 # Нашли нужный индекс
            #puts "Index: #{index}"
            shift_forward(index)
            @array[index] = val
            @size += 1
          end
    end
  end

  def delete(val)
    unless (i = binsearch(val)).nil? # Пока не найдем нужный индекс
      shift_backward(i); @size -= 1  # Забрасываем на место удаляемого элемента последний и уменьшаем размер на единицу
    end
  end

  def print_whole
    #(0...@size).each do |i|
      #puts @array[i]
    #end
    print @array
    puts
  end

  private

  def binsearch(key, left = 0, right = nil)
    right = @size - 1 unless right
    mid = (left + right) / 2

    return nil if left > right

    if key == @array[mid]
      return mid
    elsif key > @array[mid]
      binsearch(key, mid + 1, right)
    else
      binsearch(key, left, mid - 1)
    end
    end

end


=begin
if __FILE__ == $0

  a = BinSet.new
  a.empty
  (BinSet::DEF_SIZE).times do
    tmp=gets.to_i
    a.insert(tmp)
  end
  a.print_whole

end
=end
