# Ограниченное множество - линейный поиск
class LSet
  DEF_SIZE = 7

  def initialize(size = DEF_SIZE)
    @array = Array.new(size)
    empty
  end

  def empty; @size = 0 end

  def empty?; @size == 0 end

  def include?(val)
    !search(val).nil? # Является ли элементом множества
  end

  def insert(val)
    if search(val).nil?
      raise 'LSet is full' if @size >= @array.size # Если такого элемента не было, но и места тоже нет, то кидаем эксепшн
      @array[@size] = val; @size += 1  # Если место есть и такого элемента ранее не было - добавляем
    end
  end

  def delete(val)
    unless (i = search(val)).nil? # Пока не найдем нужный индекс
      @array[i] = @array[@size - 1]; @size -= 1  # Забрасываем на место удаляемого элемента последний и уменьшаем размер на единицу
    end
  end

  private

  def search(val)
    (0...@size).each do |i|
      return i if @array[i] == val
    end
    nil
  end
end
