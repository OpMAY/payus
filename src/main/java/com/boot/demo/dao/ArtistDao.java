package com.boot.demo.dao;

import com.boot.demo.mapper.ArtistMapper;
import com.boot.demo.model.Artist;
import com.boot.demo.model.ColumnInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ArtistDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public List<ColumnInfo> getArtistColumnInfo(){
        ArtistMapper artistMapper = sqlSession.getMapper(ArtistMapper.class);
        return artistMapper.getArtistColumnInfo();
    }

    public List<Artist> getArtistList(){
        ArtistMapper artistMapper = sqlSession.getMapper(ArtistMapper.class);
        return artistMapper.getArtistList();
    }
}
