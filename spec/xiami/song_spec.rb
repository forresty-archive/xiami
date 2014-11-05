# coding: utf-8
require "spec_helper"

module Xiami
  describe Song do
    it { should respond_to :name }
    it { should respond_to :artist }
    it { should respond_to :album }
    it { should respond_to :local_file_path }
    it { should respond_to :local_file_path= }

    it { should respond_to :title }
    it { should respond_to :artist_name }
    it { should respond_to :album_name }

    describe '#new' do
      it 'parses data' do
        song = Song.new('http://www.xiami.com/song/1773357685')

        song.temporary_url.should == 'http://m5.file.xiami.com/516/37516/705574889/1773357685_15603838_l.mp3?auth_key=33b783883a2ffa9e9df48e5dd456ebad-1415232000-0-null'

        song.album.id.should == '705574889'
        song.album.name.should == 'Guardians of the Galaxy'
        song.album.cover_url.should == 'http://img.xiami.net/images/album/img16/37516/7055748891405574890_3.jpg'

        song.artist.id.should == '37516'
        song.artist.name.should == 'Rupert Holmes'
      end

      it 'accepts song id as well' do
        song = Song.new('1773357685')

        song.album.id.should == '705574889'
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
