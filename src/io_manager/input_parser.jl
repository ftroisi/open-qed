"""This module contains the functions used to parse the input file"""
module InputParser
import YAML

mutable struct InputFile
    file_name::String
    file::Dict{Any, Any}

    get_int64_value::Function
    get_int32_value::Function

    function InputFile(file_name::String)
        # First, parse the input \file
        file = read_yml_file(file_name)
        # Then create the object
        obj = new(file_name, file)
        obj.get_int64_value = (args...; kwargs...) -> _get_int64_value(obj, args...; kwargs...)
        obj.get_int32_value = (args...; kwargs...) -> _get_int32_value(obj, args...; kwargs...)
        return obj
    end
end

function _get_int64_value(
        input_file::InputFile, key::String; default::Union{Int64, Nothing} = nothing)::Int64
    try
        if haskey(input_file.file, key)
            return convert(Int64, input_file.file[key])
        else
            if default === nothing
                throw(ArgumentError(
                    "The key $key is not in the file and no default value was provided."))
            else
                return default
            end
        end
    catch e
        throw(e)
    end
end

function _get_int32_value(
    input_file::InputFile, key::String; default::Union{Int32, Nothing} = nothing)::Int32
    try
        if haskey(input_file.file, key)
            return convert(Int32, input_file.file[key])
        else
            if default === nothing
                throw(ArgumentError(
                    "The key $key is not in the file and no default value was provided."))
            else
                return default
            end
        end
    catch e
        throw(e)
    end
end

"""
This method reads the YAML file and returns a dictionary whose values are the parameters in the file

Args:
    file_name: The name of the file to be read

Returns:
    A dictionary with the parameters in the file
"""
function read_yml_file(file_name::String)::Dict{Any, Any}
    try
        return convert(Dict{String, Any}, YAML.load(open(file_name)))
    catch e
        throw(e)
    end
end

end