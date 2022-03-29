package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.BlindMap;
import yunseunghwan.used.domain.Blind;

@Repository
public class BlindDaoImpl implements BlindDao{
	@Autowired private BlindMap blindMap;
	
	@Override
	public List<Blind> selectBlinds() {
		return blindMap.selectBlinds();
	}
	
	@Override
	public Blind selectBlind(Blind blind) {
		return blindMap.selectBlind(blind);
	}
	
	@Override
	public void insertBlind(Blind blind) {
		blindMap.insertBlind(blind);
	}
	
	@Override
	public void updateBlind(Blind blind) {
		blindMap.updateBlind(blind);
	}
	
	@Override
	public void deleteBlind(int blindNum) {
		blindMap.deleteBlind(blindNum);
	}
}
