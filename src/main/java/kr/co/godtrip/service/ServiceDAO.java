package kr.co.godtrip.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ServiceDAO {

    @Autowired
    SqlSession sqlSession;

    public void serviceInsert(ServiceDTO dto) {
        sqlSession.insert("service.serviceInsert", dto);
    }

    public void serviceDelete(int cno) {
        sqlSession.delete("service.serviceDelete", cno);
    }

    public void serviceUpdate(ServiceDTO dto) {
        sqlSession.update("service.serviceUpdate", dto);
    }

    public List<Map<String, Object>> list(Map<String, Object> map) {
        return sqlSession.selectList("service.serviceList", map);
    }

    public ServiceDTO serviceDetail(int cno) {
        return sqlSession.selectOne("service.serviceDetail", cno);
    }

    public int getTotalCount(Map<String, Object> map) {
        return sqlSession.selectOne("service.getTotalCount", map);
    }
}
