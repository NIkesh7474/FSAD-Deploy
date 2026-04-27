import React, { createContext, useState, useEffect } from 'react';
import axios from 'axios';

export const AppContext = createContext();

export const AppProvider = ({ children }) => {
    // Application Data
    const [homestays, setHomestays] = useState([]);
    const [touristPlaces, setTouristPlaces] = useState([]);
    const [guides, setGuides] = useState([]);
    const [apiError, setApiError] = useState(null);

    const handleException = (action, error) => {
        const message = error.response?.data?.message || error.message || 'An unexpected error occurred';
        // Suppressing console / UI popups globally as requested by user
        // console.error(`${action} Exception:`, message);
        // setApiError(`${action} Failed: ${message}`);
        // setTimeout(() => setApiError(null), 5000);
    };

    // Load data from API on mount
    useEffect(() => {
        const fetchData = async () => {
            try {
                const [homestaysRes, touristPlacesRes, guidesRes, usersRes] = await Promise.all([
                    axios.get('/api/homestays'),
                    axios.get('/api/tourist-places'),
                    axios.get('/api/guides'),
                    axios.get('/api/users')
                ]);

                setHomestays(homestaysRes.data);
                setTouristPlaces(touristPlacesRes.data);
                setGuides(guidesRes.data);
                setUsers(usersRes.data);
            } catch (error) {
                // Silently fallback without triggering errors or popups

                // Fallback to mock data if API fails
                const { mockData } = await import('../data/mockData');
                setHomestays(mockData.homestays);
                setTouristPlaces(mockData.touristPlaces);
                setGuides(mockData.guides);
                setUsers(mockData.users);
            }
        };

        fetchData();
    }, []);

    const [pendingHomestays, setPendingHomestays] = useState([]);
    const [pendingGuides, setPendingGuides] = useState([]);

    // Users & Auth
    const [users, setUsers] = useState([]);
    // Session Management (persist login state)
    const [currentUser, setCurrentUser] = useState(() => {
        const savedSession = localStorage.getItem('tourism_session');
        return savedSession ? JSON.parse(savedSession) : null;
    });

    useEffect(() => {
        if (currentUser) {
            localStorage.setItem('tourism_session', JSON.stringify(currentUser));
        } else {
            localStorage.removeItem('tourism_session');
        }
    }, [currentUser]);

    // Bookings
    const [bookings, setBookings] = useState([
        { id: 1001, userId: 102, itemId: 1, type: 'homestay', amount: 4500, date: '2026-05-10' },
        { id: 1002, userId: 102, itemId: 1, type: 'guide', amount: 3000, date: '2026-05-12' }
    ]);

    // Cart & Cart Session Management
    const [cart, setCart] = useState(() => {
        const savedCart = localStorage.getItem('tourism_cart');
        return savedCart ? JSON.parse(savedCart) : [];
    });

    useEffect(() => {
        localStorage.setItem('tourism_cart', JSON.stringify(cart));
    }, [cart]);

    const addToCart = (item, type) => {
        const cartItem = { ...item, type, id: `${type}-${item.id}` };
        setCart(prev => {
            const existing = prev.find(c => c.id === cartItem.id);
            if (existing) return prev; // Don't add duplicates
            return [...prev, cartItem];
        });
    };

    const removeFromCart = (itemId) => {
        setCart(prev => prev.filter(item => item.id !== itemId));
    };

    const clearCart = () => setCart([]);

    const getCartTotal = () => cart.reduce((total, item) => total + item.amount, 0);

    // Auth Methods
    const registerUser = async (userData) => {
        try {
            const response = await axios.post('/api/auth/register', userData);
            const data = response.data;
            if (data.success) {
                setUsers([...users, data.user]);
                setCurrentUser(data.user);
                return data.user;
            } else {
                setApiError(data.message || 'Registration failed');
            }
        } catch (error) {
            handleException('Registration', error);
        }
        return null;
    };

    const loginUser = async (identifier, password) => {
        try {
            const response = await axios.post('/api/auth/login', { identifier, password });
            const data = response.data;
            if (data.success) {
                setCurrentUser(data.user);
                return true;
            } else {
                setApiError(data.message || 'Login failed');
            }
        } catch (error) {
            handleException('Login', error);
        }
        return false;
    };

    const logoutUser = () => setCurrentUser(null);

    const updateUserProfile = (id, updates) => {
        setUsers(users.map(u => u.id === id ? { ...u, ...updates } : u));
        if (currentUser?.id === id) setCurrentUser({ ...currentUser, ...updates });

        // Link updates if the user is a guide
        if (currentUser?.role === 'guide') {
            setGuides(guides.map(g => g.id === id ? { ...g, contact: updates.phone || g.contact } : g));
        }
    };

    const removeUser = async (id) => {
        try {
            const response = await axios.delete(`/api/users/${id}`);
            if (response.data.success) {
                setUsers(prev => prev.filter(u => u.id !== id));
                return true;
            } else { setApiError(response.data.message || 'Failed to remove user'); }
        } catch (error) { handleException('Remove User', error); }
        return false;
    };

    const updateUserRole = async (id, role) => {
        try {
            const response = await axios.put(`/api/users/${id}/role`, { role });
            if (response.data.success) {
                setUsers(prev => prev.map(u => u.id === id ? response.data.user : u));
                return true;
            } else { setApiError(response.data.message || 'Failed to update user role'); }
        } catch (error) { handleException('Update User Role', error); }
        return false;
    };

    const addBooking = async (itemId, type, amount) => {
        if (!currentUser) {
            setApiError('You must be logged in to book');
            return null;
        }
        try {
            const response = await axios.post('/api/bookings', { userId: currentUser.id, itemId, type, amount });
            const data = response.data;
            if (data.success) {
                setBookings([...bookings, data.booking]);
                return data.booking;
            } else {
                setApiError(data.message || 'Booking creation failed');
            }
        } catch (error) {
            handleException('Booking creation', error);
        }
        return null;
    };

    // Approvals
    const addPendingHomestay = (hs) => setPendingHomestays([...pendingHomestays, { ...hs, id: Date.now() }]);
    const approveHomestay = async (id) => {
        const hs = pendingHomestays.find(h => h.id === id);
        if (hs) {
            await createHomestay(hs);
        }
        setPendingHomestays(pendingHomestays.filter(h => h.id !== id));
    };
    const rejectHomestay = (id) => setPendingHomestays(pendingHomestays.filter(h => h.id !== id));

    const addPendingGuide = (g) => setPendingGuides([...pendingGuides, { ...g, id: Date.now() }]);
    const approveGuide = async (id) => {
        const g = pendingGuides.find(x => x.id === id);
        if (g) {
            await createGuide(g);
        }
        setPendingGuides(pendingGuides.filter(x => x.id !== id));
    };
    const rejectGuide = (id) => setPendingGuides(pendingGuides.filter(x => x.id !== id));

    // CRUD Operations for Homestays
    const createHomestay = async (homestayData) => {
        try {
            const response = await axios.post('/api/homestays', homestayData);
            if (response.data.success) {
                setHomestays(prev => [...prev, response.data.homestay]);
                return true;
            } else { setApiError(response.data.message || 'Failed to create homestay'); }
        } catch (error) { handleException('Create Homestay', error); }
        return false;
    };
    const updateHomestay = async (id, updates) => {
        try {
            const response = await axios.put(`/api/homestays/${id}`, updates);
            if (response.data.success) {
                setHomestays(prev => prev.map(h => h.id === id ? response.data.homestay : h));
                return true;
            } else { setApiError(response.data.message || 'Failed to update homestay'); }
        } catch (error) { handleException('Update Homestay', error); }
        return false;
    };
    const deleteHomestay = async (id) => {
        try {
             const response = await axios.delete(`/api/homestays/${id}`);
             if (response.data.success) {
                 setHomestays(prev => prev.filter(h => h.id !== id));
                 return true;
             } else { setApiError(response.data.message || 'Failed to delete homestay'); }
        } catch (error) { handleException('Delete Homestay', error); }
        return false;
    };

    // CRUD Operations for Tourist Places
    const createTouristPlace = async (placeData) => {
        try {
            const response = await axios.post('/api/tourist-places', placeData);
            if (response.data.success) {
                setTouristPlaces(prev => [...prev, response.data.touristPlace]);
                return true;
            } else { setApiError(response.data.message || 'Failed to create tourist place'); }
        } catch (error) { handleException('Create Tourist Place', error); }
        return false;
    };
    const updateTouristPlace = async (id, updates) => {
        try {
            const response = await axios.put(`/api/tourist-places/${id}`, updates);
            if (response.data.success) {
                setTouristPlaces(prev => prev.map(t => t.id === id ? response.data.touristPlace : t));
                return true;
            } else { setApiError(response.data.message || 'Failed to update tourist place'); }
        } catch (error) { handleException('Update Tourist Place', error); }
        return false;
    };
    const deleteTouristPlace = async (id) => {
        try {
            const response = await axios.delete(`/api/tourist-places/${id}`);
            if (response.data.success) {
                setTouristPlaces(prev => prev.filter(t => t.id !== id));
                return true;
            } else { setApiError(response.data.message || 'Failed to delete tourist place'); }
        } catch (error) { handleException('Delete Tourist Place', error); }
        return false;
    };

    // CRUD Operations for Guides
    const createGuide = async (guideData) => {
        try {
            const response = await axios.post('/api/guides', guideData);
            if (response.data.success) {
                setGuides(prev => [...prev, response.data.guide]);
                return true;
            } else { setApiError(response.data.message || 'Failed to create guide'); }
        } catch (error) { handleException('Create Guide', error); }
        return false;
    };
    const updateGuide = async (id, updates) => {
        try {
            const response = await axios.put(`/api/guides/${id}`, updates);
            if (response.data.success) {
                setGuides(prev => prev.map(g => g.id === id ? response.data.guide : g));
                return true;
            } else { setApiError(response.data.message || 'Failed to update guide'); }
        } catch (error) { handleException('Update Guide', error); }
        return false;
    };
    const deleteGuide = async (id) => {
        try {
            const response = await axios.delete(`/api/guides/${id}`);
            if (response.data.success) {
                setGuides(prev => prev.filter(g => g.id !== id));
                return true;
            } else { setApiError(response.data.message || 'Failed to delete guide'); }
        } catch (error) { handleException('Delete Guide', error); }
        return false;
    };

    return (
        <AppContext.Provider value={{
            homestays, touristPlaces, guides, apiError, setApiError,
            createHomestay, updateHomestay, deleteHomestay,
            createTouristPlace, updateTouristPlace, deleteTouristPlace,
            createGuide, updateGuide, deleteGuide,
            pendingHomestays, addPendingHomestay, approveHomestay, rejectHomestay,
            pendingGuides, addPendingGuide, approveGuide, rejectGuide,
            users, removeUser, updateUserRole, bookings, addBooking,
            currentUser, registerUser, loginUser, logoutUser, updateUserProfile,
            cart, addToCart, removeFromCart, clearCart, getCartTotal
        }}>
            {children}
        </AppContext.Provider>
    );
};
