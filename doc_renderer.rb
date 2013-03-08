require './records'

class DocRenderer
  def initialize
  end

  def render(filename, records, fout)
    fout.puts "# #{filename}"
    fout.puts ""

    fout.puts ""
    fout.puts "## Comments"
    fout.puts ""

    records.comment_blocks.each do |comment|
      fout.puts comment
      fout.puts ""
    end

    fout.puts ""
    fout.puts "## Imported Files"
    fout.puts ""

    records.imported_files.each do |filename|
      fout.puts "* #{filename}"
    end

    fout.puts ""
    fout.puts "## Used Mixins"
    fout.puts ""

    records.used_mixins.each do |mixin|
      fout.puts "* **#{mixin[:name]}**"
    end

    fout.puts ""
    fout.puts "## Defined Mixins"
    fout.puts ""

    records.defined_mixins.each do |mixin|
      readable_args = mixin[:args].map {|set| "$#{set[0].name}: #{set[1].class.to_s}" }.join(", ")
      fout.puts "* **#{mixin[:name]}**(#{readable_args})"
    end

    fout.puts ""
    fout.puts "## Variables"
    fout.puts ""

    records.variables.each do |variable|
      fout.puts "* $#{variable[:name]}: #{variable[:expr].to_sass}"
    end

    fout.puts ""
  end
end
