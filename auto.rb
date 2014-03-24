# you can edit this file to play with the csv. running this file will run all the commands in a row. alternatively, you can load the auto_csv.rb file into IRB and play with it that way
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
#ct.add_new_row(2012, "BMW", "Z5", "Sweetness", "too much")
#ct.add_another_row(2014, "Subaru", "Outback", "Perfect for Boulder", 26000.00)
ct.write_to_file
#ct.delete_row(0)
#ct.delete_column("Price")
ct.reset_csv