package kr.co.godtrip.KakaoPay2;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoPay2DAO {

	@Autowired
    private SqlSession sqlSession;
}
