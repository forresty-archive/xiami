# coding: utf-8
require "spec_helper"

module Xiami
  describe Song do
    it { should respond_to :name }
    it { should respond_to :artist }
    it { should respond_to :album }
    it { should respond_to :local_file_path }
    it { should respond_to :local_file_path= }

    describe '#new' do
      it 'parses data' do
        song = Song.new('http://www.xiami.com/song/3495768')

        song.temporary_url.should == 'http://m5.file.xiami.com/104/5104/315098/3495768_10729341_l.mp3?auth_key=4b470a652c4457234e9dabb80a90b8ba-1414454400-0-null'

        song.album.id.should == '315098'
        song.album.name.should == 'My Life + Best'
        song.album.cover_url.should == 'http://img.xiami.net/images/album/img4/5104/3150981231826033_3.jpg'

        song.artist.id.should == '5104'
        song.artist.name.should == '이선희'
      end

      it 'accepts song id' do
        song = Song.new('3495768')

        song.album.id.should == '315098'
      end
    end

    describe '#==' do
      let(:song1) { Song.new.tap { |song| song.id = '123' } }
      let(:song2) { Song.new.tap { |song| song.id = '123' } }
      let(:song3) { Song.new.tap { |song| song.id = '1234' } }
      let(:song4) { Song.new.tap { |song| song.id = nil } }

      it 'test equality base on id' do
        song1.should == song2
        song2.should_not == song3
        song1.should_not == nil
        song1.should_not == song4
      end
    end
  end
end
