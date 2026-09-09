// Configuration
const Config = {
    duration: 5000,
    musicVolume: 0.6,
    showProgress: true,
    autoChangeMusic: true,
    musicChangeInterval: 120000 // 2 minutes
};

// Music playlist
const playlist = [
    { id: 1, name: 'Zombie Apocalypse', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', volume: 0.6 },
    { id: 2, name: 'Dark Ambient', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', volume: 0.5 },
    { id: 3, name: 'Horror Theme', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', volume: 0.7 },
    { id: 4, name: 'Undead Rising', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', volume: 0.55 },
    { id: 5, name: 'Survival Horror', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3', volume: 0.65 }
];

const tips = [
    'Use /spawninzombie to spawn zombies',
    'Zombies will attack if you get too close',
    'Adjust music with /setloadingmusic',
    'Stay alive and survive the undead',
    'Zombies can be found in multiple locations',
    'Your health determines your survival',
    'Zombies despawn when you are far away',
    'Collect resources and defend your position',
    'Work with other players to survive',
    'Zombies get stronger at night'
];

let currentMusicIndex = 0;
let isPlaying = true;
let progress = 0;
let progressInterval = null;

// Initialize
window.addEventListener('DOMContentLoaded', () => {
    initializeUI();
    startLoading();
    setupMusicControls();
    displayRandomTip();
});

// Initialize UI
function initializeUI() {
    const audio = document.getElementById('loadingAudio');
    audio.volume = Config.musicVolume;
    audio.crossOrigin = 'anonymous';
    audio.addEventListener('error', () => {
        console.error('Error loading audio');
        playNextMusic();
    });
    audio.addEventListener('ended', () => {
        if (isPlaying) {
            playNextMusic();
        }
    });
}

// Start loading animation
function startLoading() {
    const startTime = Date.now();
    const duration = Config.duration;
    
    progressInterval = setInterval(() => {
        const elapsed = Date.now() - startTime;
        progress = Math.min((elapsed / duration) * 100, 100);
        
        updateProgressBar(progress);
        
        if (progress >= 100) {
            clearInterval(progressInterval);
            completeLoading();
        }
    }, 50);
    
    // Play music
    playMusic(currentMusicIndex);
}

// Update progress bar
function updateProgressBar(percent) {
    const progressBar = document.getElementById('progressBar');
    const progressText = document.getElementById('progressText');
    
    progressBar.style.width = percent + '%';
    progressText.textContent = Math.floor(percent) + '%';
}

// Play music
function playMusic(index) {
    if (index >= 0 && index < playlist.length) {
        currentMusicIndex = index;
        const music = playlist[index];
        const audio = document.getElementById('loadingAudio');
        
        audio.src = music.url;
        audio.volume = music.volume || Config.musicVolume;
        
        if (isPlaying) {
            audio.play().catch(err => {
                console.error('Play error:', err);
            });
        }
        
        updateMusicInfo(music.name);
        updateMusicButtonState();
    }
}

// Play next music
function playNextMusic() {
    currentMusicIndex = (currentMusicIndex + 1) % playlist.length;
    playMusic(currentMusicIndex);
    displayNotification('Next song playing: ' + playlist[currentMusicIndex].name);
}

// Play previous music
function playPreviousMusic() {
    currentMusicIndex = (currentMusicIndex - 1 + playlist.length) % playlist.length;
    playMusic(currentMusicIndex);
    displayNotification('Previous song: ' + playlist[currentMusicIndex].name);
}

// Toggle music play/pause
function toggleMusic() {
    const audio = document.getElementById('loadingAudio');
    isPlaying = !isPlaying;
    
    if (isPlaying) {
        audio.play();
    } else {
        audio.pause();
    }
    
    updateMusicButtonState();
}

// Update music button state
function updateMusicButtonState() {
    const toggleBtn = document.getElementById('toggleMusic');
    toggleBtn.textContent = isPlaying ? '⏸' : '▶';
}

// Update music info
function updateMusicInfo(name) {
    document.getElementById('musicInfo').textContent = '♫ ' + name;
}

// Setup music controls
function setupMusicControls() {
    document.getElementById('prevMusic').addEventListener('click', playPreviousMusic);
    document.getElementById('nextMusic').addEventListener('click', playNextMusic);
    document.getElementById('toggleMusic').addEventListener('click', toggleMusic);
    
    document.getElementById('volumeSlider').addEventListener('input', (e) => {
        const volume = e.target.value / 100;
        document.getElementById('loadingAudio').volume = volume;
        displayNotification('Volume: ' + Math.floor(volume * 100) + '%');
    });
}

// Display random tip
function displayRandomTip() {
    const tip = tips[Math.floor(Math.random() * tips.length)];
    document.getElementById('tipText').textContent = '💡 ' + tip;
}

// Display notification
function displayNotification(message) {
    const tipContainer = document.getElementById('tipText');
    const oldText = tipContainer.textContent;
    tipContainer.textContent = '📢 ' + message;
    
    setTimeout(() => {
        tipContainer.textContent = oldText;
    }, 3000);
}

// Complete loading
function completeLoading() {
    const audio = document.getElementById('loadingAudio');
    audio.pause();
    console.log('Loading complete!');
    // You can add additional logic here for when loading finishes
}

// Receive data from NUI
window.addEventListener('message', (event) => {
    const data = event.data;
    
    if (data.type === 'updateProgress') {
        updateProgressBar(data.progress);
    }
    
    if (data.type === 'setMusic') {
        if (data.index >= 0 && data.index < playlist.length) {
            playMusic(data.index);
        }
    }
    
    if (data.type === 'setVolume') {
        const audio = document.getElementById('loadingAudio');
        audio.volume = data.volume / 100;
        document.getElementById('volumeSlider').value = data.volume;
    }
    
    if (data.type === 'toggleMusic') {
        toggleMusic();
    }
});
