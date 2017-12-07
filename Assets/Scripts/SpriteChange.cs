using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpriteChange : MonoBehaviour {

    private Material mat;
	// Use this for initialization
	void Start () {
        mat = GetComponent<Renderer>().material;
        StartCoroutine(SpriteChangeEffect());
	}
	
    IEnumerator SpriteChangeEffect()
    {
        while (true)
        { 
            float parameter = (1 + Mathf.Sin(Time.time))/2;
            mat.SetFloat("_Tween", parameter);
            yield return new WaitForSeconds(0.05f);
        }
    }
}
