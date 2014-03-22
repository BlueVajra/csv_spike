require 'csv'

class AutoCSV
  attr_accessor :file

  def initialize(filepath)
    # This is not good for large CSVs due to memory issues.
    # This loads the entire csv-file into the variable/memory
    @filepath = filepath
    load_file
  end

  def load_file
    @file = CSV.read(@filepath, headers: true)
  end

  def p_csv
    puts "---------------------------"
    puts "|       Table as CSV      |"
    puts "---------------------------"
    p @file
    puts "\n"
  end

  def puts_csv
    puts "---------------------------"
    puts "|      Table as Text      |"
    puts "---------------------------"
    puts @file
    puts "\n"
  end

  def show_csv
    puts "---------------------------"
    puts "|    Table Rows as CSV    |"
    puts "---------------------------"
    @file.each do |row|
      p row
    end
    puts "\n"
  end

  def p_row(row_index)
    puts "---------------------------"
    puts "|        Row  as CSV      |"
    puts "---------------------------"
    p @file[row_index]
    puts "\n"
  end

  def puts_row(row_index)
    puts "---------------------------"
    puts "|       Row as Text       |"
    puts "---------------------------"
    puts @file[row_index]
    puts "\n"
  end

  def show_column(col_name)
    puts "---------------------------"
    puts "|     Column as Array     |"
    puts "---------------------------"
    p @file[col_name]
    puts "\n"
  end

  def show_table_as_array
    puts "---------------------------"
    puts "|   Table as Multi-Array  |(with Headers)"
    puts "---------------------------"
    p @file.to_a
    puts "\n"
  end

  def show_value(row, column)
    puts "---------------------------"
    puts "|  Show val at row/column |"
    puts "---------------------------"
    puts "@file[row][column]"
    p @file[row][column]
    puts "@file[column][row]"
    p @file[column][row]
    puts "\n"
  end

  def show_headers
    puts "---------------------------"
    puts "|  Show Headers as Array  |"
    puts "---------------------------"
    p @file.headers
    puts "\n"
  end

  def section2
    puts "\n============================================"
    puts "    Adding and deleting from CSV"
    puts "============================================"
  end

  def add_new_row(year, make, model, desc, price)
    puts "---------------------------------"
    puts "|  Add row to object (not file) |"
    puts "---------------------------------"
    @file << [year, make, model, desc, price]
    puts @file
    puts "\n"
  end

  def add_another_row(year, make, model, desc, price)
    puts "---------------------------------"
    puts "|  Add row to file and reload   |"
    puts "---------------------------------"
    CSV.open(@filepath, "a") do |csv|
      csv << [year, make, model, desc, price]
    end
    load_file
    puts @file
    puts "\n"
  end

  def write_to_file
    puts "---------------------------------"
    puts "|  Add rows to file and then    |"
    puts "|     write object to file      |"
    puts "|       (notice no BMW)         |"
    puts "---------------------------------"

    @file << [2015, "Kia", "Model 1", "first Test", 12000.00]
    @file << [2018, "Audi", "Model T", "Second Test", 14000.00]


    CSV.open(@filepath, "wb") do |csv|
      @file.each do |row|
        csv << row
      end
    end
    load_file
    puts @file
    puts "\n"
  end

  #def add_another_row(year, make, model, desc, price)
  #  @file << [year, make, model, desc, price]
  #  puts @file
  #  puts "\n"
  #end
  def delete_row(row)
    puts "---------------------------"
    puts "|       Delete Row        |"
    puts "---------------------------"
    @file.delete('row')
    puts @file
    puts "\n"
  end

  def delete_column(column)
    puts "---------------------------"
    puts "|      Delete Column      |"
    puts "---------------------------"
    @file.delete('column')
    puts @file
    puts "\n"
  end

end

ct = AutoCSV.new("auto.csv")
ct.p_csv
ct.puts_csv
ct.show_csv
ct.p_row(1)
ct.puts_row(1)
ct.show_column("Year")
ct.show_table_as_array
ct.show_value(2, "Year")
ct.show_headers
ct.section2
ct.add_new_row(2012, "BMW", "Z5", "Sweetness", "too much")
ct.add_another_row(2014, "Subaru", "Outback", "Perfect for Boulder", 26000.00)
ct.write_to_file
#ct.delete_row(0)
#ct.delete_column("Price")
