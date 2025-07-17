if (isActive) {
    alpha += fadeDirection * fadeSpeed;
    
    if (alpha >= 1) {
        alpha = 1;
        fadeDirection = -1;  
        flashCount++;
    } else if (alpha <= 0) {
        alpha = 0;
        fadeDirection = 1;  
        
        if (flashCount >= maxFlashes) {
            instance_destroy();
        }
    }
    
    image_alpha = alpha;
}