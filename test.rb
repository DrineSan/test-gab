require 'rubygems'
require 'bundler/setup'

require 'pdf-reader'

# filename = 'statuts_dariobat'
# docs = Dir[filename+'.pdf']
# puts Docsplit.extract_text(docs, :ocr => true, :output => 'storage/text')
# text = File.read('storage/text/'+ filename + '.txt')
# puts text

reader = PDF::Reader.new('statuts_sas_ercisol.pdf')

# puts reader.page_count

pages = reader.pages.map do |page|
   page.text
end

content = pages.join('\n')

content = content.gsub!(/[\n]+/, "\n")

File.open("out2.txt", 'w') {|f| f.write("#{content}") }

content = content.gsub!(/(?<=[^\.:!?-])([\n]+)(?=([^A-Z\d]))/m, " ")

# content = content.gsub!(/(?<![ARTICLE ])\d+/m, "\n")

File.open("out3.txt", 'w') {|f| f.write("#{content}") }

puts File.read("out3.txt").scan(/ARTICLE\s+[\d]+/)

puts File.read("out3.txt").scan(/ARTICLE\s[\d]+\.+[^\n]+/)

puts File.read("out3.txt").scan(/ARTICLE(.|\n)+(?=ARTICLE)/)


# puts File.read("out.txt").match(/^ARTICLEGKJBKJBV/)
