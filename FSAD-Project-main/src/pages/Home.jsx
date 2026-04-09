import React, { useState, useEffect } from 'react';
import { MapPin, Search as SearchIcon, MessageCircle } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

export default function Home() {
    const [query, setQuery] = useState('');
    const [animated, setAnimated] = useState(false);
    const navigate = useNavigate();

    useEffect(() => {
        const timer = setTimeout(() => setAnimated(true), 100);
        return () => clearTimeout(timer);
    }, []);

    const handleSearch = () => {
        if (query.trim()) {
            navigate(`/search?q=${encodeURIComponent(query)}`);
        } else {
            navigate(`/search?q=`);
        }
    };

    return (
        <>
            <section className="hero" style={{
                transform: animated ? 'translateY(0)' : 'translateY(50px)',
                opacity: animated ? 1 : 0,
                transition: 'all 1s ease-out'
            }}>
                <MapPin className="hero-icon" size={80} strokeWidth={2} />
                <h1 className="hero-title">
                    Discover Your Perfect Stay
                </h1>
                <p className="hero-subtitle">
                    Connect with unique homestays, hotels, and local experiences worldwide
                </p>

                <div className="search-container" style={{
                    transform: animated ? 'scale(1)' : 'scale(0.8)',
                    transition: 'transform 0.8s ease-out 0.3s'
                }}>
                    <input
                        type="text"
                        placeholder="Search for a destination..."
                        className="search-input"
                        value={query}
                        onChange={(e) => setQuery(e.target.value)}
                        onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
                    />
                    <button className="btn search-btn" onClick={handleSearch}>
                        <SearchIcon size={20} strokeWidth={2.5} />
                        <span style={{ marginLeft: '4px' }}>Search</span>
                    </button>
                </div>
            </section>

            <div className="chat-bubble" onClick={() => alert("Connecting to an agent...")}>
                <MessageCircle size={24} />
            </div>
        </>
    );
}
