import React, { useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { AppContext } from '../context/AppContext';

export default function Auth() {
    const [isLogin, setIsLogin] = useState(false);
    const { registerUser, loginUser } = useContext(AppContext);
    const navigate = useNavigate();

    const [formData, setFormData] = useState({
        name: '', email: '', password: '', phone: '', identifier: '', role: 'user'
    });

    const handleChange = (e) => setFormData({ ...formData, [e.target.name]: e.target.value });

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (isLogin) {
            const success = await loginUser(formData.identifier, formData.password);
            if (success) {
                navigate('/');
            } else {
                alert('Invalid username/email or password.');
            }
        } else {
            await registerUser({ name: formData.name, email: formData.email, password: formData.password, phone: formData.phone, role: formData.role });

            if (formData.role === 'guide') {
                alert('Registration complete! You are now listed as an active Tour Guide on the platform.');
                navigate('/guide-portal');
            } else {
                navigate('/');
            }
        }
    };

    return (
        <div className="container" style={{ padding: '6rem 1.5rem', display: 'flex', justifyContent: 'center' }}>
            <div className="auth-card" style={{ padding: '3rem', width: '100%', maxWidth: '480px' }}>
                <h2 style={{ textAlign: 'center', marginBottom: '2rem', fontSize: '2rem', fontWeight: 800 }}>{isLogin ? 'Sign In' : 'Sign Up'}</h2>

                <form style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }} onSubmit={handleSubmit}>
                    {!isLogin && (
                        <>
                            <div className="form-group">
                                <label>I am joining as a...</label>
                                <select name="role" value={formData.role} onChange={handleChange} className="input-field">
                                    <option value="user">Regular User (Tourist)</option>
                                    <option value="guide">Local Tour Guide</option>
                                    <option value="admin">Platform Admin</option>
                                </select>
                            </div>
                            <div className="form-group">
                                <label>Username</label>
                                <input required name="name" type="text" placeholder="Your Username" value={formData.name} onChange={handleChange} className="input-field" />
                            </div>
                            <div className="form-group">
                                <label>Phone Number</label>
                                <input required name="phone" type="tel" placeholder="+91 12345 67890" value={formData.phone} onChange={handleChange} className="input-field" />
                            </div>
                        </>
                    )}
                    <div className="form-group">
                        <label>{isLogin ? 'Email or Username' : 'Email Address'}</label>
                        <input required name={isLogin ? 'identifier' : 'email'} type={isLogin ? 'text' : 'email'} placeholder={isLogin ? 'Enter email or username' : 'you@example.com'} value={isLogin ? formData.identifier : formData.email} onChange={handleChange} className="input-field" />
                    </div>
                    <div className="form-group">
                        <label>Password</label>
                        <input required name="password" type="password" placeholder="••••••••" value={formData.password} onChange={handleChange} className="input-field" />
                    </div>

                    <button type="submit" className="btn btn-primary" style={{ marginTop: '1rem', fontSize: '1.05rem' }}>
                        {isLogin ? 'Login to Portal' : 'Create Account'}
                    </button>
                </form>

                <p style={{ textAlign: 'center', marginTop: '1.5rem', color: 'var(--text-light)' }}>
                    {isLogin ? "Don't have an account? " : "Already have an account? "}
                    <button onClick={() => setIsLogin(!isLogin)} style={{ color: 'var(--primary-color)', fontWeight: 600, background: 'none', border: 'none', cursor: 'pointer', fontSize: '1rem' }}>
                        {isLogin ? 'Sign Up' : 'Sign In'}
                    </button>
                </p>
            </div>
        </div>
    );
}
