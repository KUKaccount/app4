class CoursesController < ApplicationController
    @courses = Course.all
    t = Tempfile.new("source_codes_zip") #=>tempファイル作成
      Zip::File.open(t.path, Zip::File::CREATE) do |zip|
        @courses.each do |course|
          if course.lessons.blank? 
            zip.mkdir "#{course.title}"#=>コースに紐付いているレッスンが無かった場合、コースのみのディレクトリを先に作成する
            next
          end
          course.lessons.each do |lesson|
            if lesson.source_codes.blank?
              zip.mkdir "#{course.title}/#{lesson.title}"#=>レッスンに紐付いているソースコードが無かった場合、レッスンのみのディレクトリを先に作成する
              next
            end
            lesson.source_codes.each do |source_code|
              zip.get_output_stream( "#{course.title}/#{lesson.title}" + "/#{source_code.title}"){ |s| s.print("#{source_code.body}")}#=>コースディレクトリ/レッスンディレクトリがあれば、それに紐づくソースコードファイルを作成。そのソースコードファイルの中身をprintメソッドで作成。
            end
          end
        end
      end
      send_file(t.path, type: 'application/zip', dispositon: 'attachment', filename: "SourceCode_#{Time.now.strftime("%Y%m%d")}.zip")#=>ダウンロードできるように、send_fileヘルパーを使う。
      t.close#=>tempファイルを削除する。
end
