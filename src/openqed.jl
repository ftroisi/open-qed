module openqed
# Imports
include("io_manager/logo.jl")
include("io_manager/input_parser.jl")

using .InputParser
using .logo

logo.print_welcome()
# Read the input file.
input_file::InputParser.InputFile = InputParser.InputFile("input.yml")
println(input_file.file_name)
println(input_file.get_int64_value("Grid"))
print(input_file.get_int64_value("test"; default = 0))

println(typeof(input_file.get_int32_value("Grid")))
println(typeof(input_file.get_int64_value("Grid")))


end
