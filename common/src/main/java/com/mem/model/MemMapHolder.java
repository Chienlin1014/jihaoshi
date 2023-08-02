package com.mem.model;

import java.util.HashMap;
import java.util.Map;

public class MemMapHolder implements MemHolder{
    private static final Map<String, MemberVO> HOLDER = new HashMap<>();

    @Override
    public void put(String key, MemberVO member) {
        HOLDER.put(key, member);
    }

    @Override
    public MemberVO get(String key) {
        return HOLDER.get(key);
    }

    @Override
    public void remove(String key) {
        HOLDER.remove(key);
    }

}
