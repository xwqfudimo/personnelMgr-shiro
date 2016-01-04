package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.EventDao;
import com.xwq.model.Event;

@Repository("eventDao")
public class EventDaoImpl extends BaseDaoImpl<Event> implements EventDao {

}
