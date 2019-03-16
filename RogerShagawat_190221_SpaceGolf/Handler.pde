public class Handler{
  LinkedList<GameObject> list = new LinkedList<GameObject>();
  
  void tick(){
    for(GameObject obj : list)
      obj.tick();
  }
  
  void render(){
    for(GameObject obj : list)
      obj.render();
  }
  
  void addObj(GameObject obj){ list.add(obj); }
  void removeObj(GameObject obj){ list.remove(obj); }
  //GameObject getObj(int n){ return list.get(n); }
  
}
