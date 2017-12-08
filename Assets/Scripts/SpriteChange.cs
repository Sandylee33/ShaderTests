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
        float start = 0f;
        float step = 0.05f;
        while (true)
        {   
            float parameter = (1 - Mathf.Cos(start))/2;
            mat.SetFloat("_Tween", parameter);
            start += step;
            yield return new WaitForSeconds(0.05f);
        }
    }
}
