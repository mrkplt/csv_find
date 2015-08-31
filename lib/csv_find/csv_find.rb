module CsvFind
  require 'csv'

  VERSION = {
    major: '0',
    minor: '0',
    patch: '1'
  }.values.join('.')

  def self.included(base)
    base.send :extend, ClassMethods
    base.send :prepend, InstanceMethods
  end

  module InstanceMethods
    attr_accessor :line_number

    def initialize(hash = {})
      hash.each { |k, v| send("#{k}=".to_sym, v) }
    end

    def ==(other)
      instance_variables.map do |instance_variable|
        instance_variable_get(instance_variable) ==
          other.instance_variable_get(instance_variable)
      end
    end

    private

    attr_reader :hash
  end

  module ClassMethods
    include Enumerable

    attr_reader :headers, :file, :file_options, :data

    def csv_file(file_name, options = {})
      @file_options = default_options.merge(options)
      @file = CSV.read(file_name)
      @headers = CSV.new(File.open(file_name, 'r'), file_options).first.headers
      define_accessors
      @file.shift if file_options[:headers]
      define_value_objects
    end

    def define_accessors
      headers.each do |header|
        send(:attr_accessor, header)
      end
    end

    def all
      data
    end

    def where(key_val_pairs)
      dig(key_val_pairs, @data)
    end

    def find(line_number)
      data.reverse.find { |row| row.line_number == line_number }
    end

    def first
      data.first
    end

    def last
      data.last
    end

    def each
      data.each do |item|
        yield item if block_given?
      end
    end

    private

    def define_value_objects
      @data = @file.each_with_index.map do |row, index|
        build_instance(data_from(row), index + line_offset)
      end
    end

    def data_from(row)
      {}.tap do |item|
        headers.each_with_index do |header, position|
          item[header] = row[position]
        end
      end
    end

    def default_options
      {
        headers: true,
        header_converters: :symbol,
        return_headers: false
      }
    end

    def dig(key_val_pairs, last_result)
      return last_result if key_val_pairs.empty? || last_result.empty?
      pair = key_val_pairs.shift
      dig(
        key_val_pairs,
        last_result.select { |item| item.send(pair.first) == pair.last }
      )
    end

    LINE_ONE_START_OFFSET = 1
    LINE_TWO_START_OFFSET = 2
    def line_offset
      return LINE_ONE_START_OFFSET unless file_options[:headers]
      LINE_TWO_START_OFFSET
    end

    def build_instance(row, line)
      new_instance = new
      row.each { |key, value| new_instance.send("#{key}=".to_sym, value) }
      new_instance.line_number = line

      new_instance
    end
  end
end
