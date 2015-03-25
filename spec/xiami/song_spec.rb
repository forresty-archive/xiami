# coding: utf-8
require "spec_helper"

module Xiami
  describe Song do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :artist }
    it { is_expected.to respond_to :album }

    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :artist_name }
    it { is_expected.to respond_to :album_name }

    describe '#fetch' do
      it 'parses data' do
        song = Song.fetch('http://www.xiami.com/song/1773357685')

        expect(song.temporary_url).to eq('http://m5.file.xiami.com/516/37516/705574889/1773357685_15603838_l.mp3?auth_key=33b783883a2ffa9e9df48e5dd456ebad-1415232000-0-null')

        expect(song.name).to eq('Escape (The Pina Colada Song)')
        expect(song.title).to eq('Escape (The Pina Colada Song)')
        expect(song.artist_name).to eq('Rupert Holmes')
        expect(song.album_name).to eq('Guardians of the Galaxy')

        expect(song.album.id).to eq(705574889)
        expect(song.album.name).to eq('Guardians of the Galaxy')
        expect(song.album.cover_url).to eq('http://img.xiami.net/images/album/img16/37516/7055748891405574890_4.jpg')

        expect(song.artist.id).to eq(37516)
        expect(song.artist.name).to eq('Rupert Holmes')
      end

      it 'accepts song id as well' do
        song = Song.fetch('1773357685')

        expect(song.album.id).to eq(705574889)
      end

      context 'when content contains html' do
        it 'unescapes' do
          song = Song.fetch(1242697)
          expect(song.album.name).to eq("(What's the Story) Morning Glory?")
        end
      end

      context 'when parsing xml fails' do
        it 'parses html' do
          song = Song.fetch(376054)
          expect(song.name).to eq('她的睫毛')
          expect(song.id).to eq(376054)
          expect(song.album.id).to eq(6650)
          expect(song.album.name).to eq('叶惠美')
          expect(song.album.cover_url).to eq('http://img.xiami.net/images/album/img60/1260/66501387132591_4.jpg')
          expect(song.artist.id).to eq(1260)
          expect(song.artist.name).to eq('周杰伦')
        end

        context 'with song id 1770769001' do
          it 'pass' do
            song = Song.fetch(1770769001)
            expect(song.artist.id).to eq(nil)
            expect(song.artist.name).to eq('梁博')
          end
        end

        context 'with song id 15914' do
          it 'pass' do
            song = Song.fetch(15914)
            expect(song.artist.id).to eq(521)
            expect(song.artist.name).to eq('李嘉强')
            expect(song.album.cover_urls.count).to eq(4)
            expect(song.album.cover_url).to eq('http://img.xiami.net/images/pic/04/04/10123658079m_2.jpg')
          end
        end
      end
    end

    describe '#==' do
      let(:song1) { Song.new.tap { |song| song.id = '123' } }
      let(:song2) { Song.new.tap { |song| song.id = '123' } }
      let(:song3) { Song.new.tap { |song| song.id = '1234' } }
      let(:song4) { Song.new.tap { |song| song.id = nil } }

      it 'test equality base on id' do
        expect(song1).to eq(song2)
        expect(song2).not_to eq(song3)
        expect(song1).not_to eq(nil)
        expect(song1).not_to eq(song4)
      end
    end
  end
end
