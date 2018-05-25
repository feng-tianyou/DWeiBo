//
//  TestPerson.swift
//  DWeiBo
//
//  Created by DaiSuke on 2018/5/23.
//  Copyright © 2018年 DaiSuke. All rights reserved.
//

import UIKit

class TestPerson: NSObject {

    var id:Int = 0
    var age:Int = 0
    var name:String?
    
    // MARK: - 系统内部方法
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override init() {
        super.init()
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    class func loadPersons() ->[TestPerson]{
        let sql = "SELECT * FROM T_Person;"
        let res = SQLiteManager.share().db!.executeQuery(sql, withArgumentsIn: nil)
        
        var models = [TestPerson]()
        while res!.next() {
            let p = TestPerson()
            let num = res?.int(forColumn: "id")
            let name = res?.string(forColumn: "name")
            let age = res?.int(forColumn: "age")
            
            p.id = Int(num!)
            p.name = name
            p.age = Int(age!)
            models.append(p)
        }
        return models
    }
    
    /// 插入一条记录
    func insertQueuePerson() ->Bool{
        assert(name != nil, "name必须有值")
        let sql = "INSERT INTO T_Person (name, age) VALUES ('\(name!)', \(self.age));"
        
        return SQLiteManager.share().db!.executeUpdate(sql, withArgumentsIn: nil)
    }

    
    
    // MARK: ==============================分界线=======================================
    
//    // MARK: - 执行数据源CRUD的操作
//    /// 查询所有TestPerson
//    class func loadPersons() -> [TestPerson] {
//        let sql = "SELECT * FROM T_Person;"
//        let result = SQLiteManager.share().execRecordSQL(sql: sql)
//        var models = [TestPerson]()
//        for dict in result {
//            models.append(TestPerson(dict: dict))
//        }
//        return models
//    }
//
//    /// 删除记录
//    func deletePerson() -> Bool {
//        let sql = "DELETE FROM T_Person WHERE age IS \(self.age);"
//        return SQLiteManager.share().execSQL(sql: sql)
//    }
//
//    /// 更新
//    func updatePerson(name:String) -> Bool {
//        let sql = "UPDATE T_Person SET NAME = '\(name)' WHERE age = \(self.age);"
//        return SQLiteManager.share().execSQL(sql: sql)
//    }
//
//    /// 插入一条记录
//    func insertPerson() -> Bool {
//        assert(name != nil, "name必须有值")
//        let sql = "INSERT INTO T_Person (name, age) VALUES ('\(name!)', \(self.age));"
//        return SQLiteManager.share().execSQL(sql: sql)
//    }
//
//    /// 插入一条记录
//    func insertQueuePerson() {
//        assert(name != nil, "name必须有值")
//        let sql = "INSERT INTO T_Person (name, age) VALUES ('\(name!)', \(self.age));"
//
//        SQLiteManager.share().execQueueSql { (manager) in
//            manager.execSQL(sql: sql)
//        }
//    }
}
